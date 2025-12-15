(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_5 ?v10 ?v4)
             (pred_8 ?v8 ?v7)
             (pred_2 ?v10 ?v7)
             (pred_11 ?v5 ?v10 )
	     (pred_9 ?v10)
             (pred_6 ?v1)
             (pred_12 ?v8)
             (pred_3 ?v7)
             (pred_1 ?v10)
             (pred_10 ?v8)
             (pred_4 ?v10)
             (pred_7 ))



(:action op_2
:parameters (?v12 ?v13 ?v2 ?v11)
:precondition (and (pred_6 ?v12) (pred_6 ?v13) (pred_12 ?v2) (pred_3 ?v11)
          (pred_5 ?v12 ?v13) (pred_8 ?v2 ?v11)
                   (pred_2 ?v13 ?v11) (pred_9 ?v12) 
                   (pred_1 ?v13) (pred_10 ?v2))
:effect (and  (pred_4 ?v13) (not (pred_1 ?v13))))


(:action op_3
:parameters (?v12 ?v9)
:precondition (and (pred_6 ?v12) (pred_6 ?v9)
               (pred_9 ?v12) (pred_5 ?v12 ?v9) (pred_4 ?v9))
:effect (and (pred_9 ?v9) (not (pred_9 ?v12))))

(:action op_5
:parameters (?v12 ?v2)
:precondition (and (pred_6 ?v12) (pred_12 ?v2) 
                  (pred_9 ?v12) (pred_11 ?v2 ?v12) (pred_7 ))
:effect (and (pred_10 ?v2)
   (not (pred_11 ?v2 ?v12)) (not (pred_7 ))))


(:action op_4
:parameters (?v12 ?v3 ?v6)
:precondition (and (pred_6 ?v12) (pred_12 ?v3) (pred_12 ?v6)
                  (pred_9 ?v12) (pred_10 ?v6) (pred_11 ?v3 ?v12))
:effect (and (pred_10 ?v3) (pred_11 ?v6 ?v12)
        (not (pred_10 ?v6)) (not (pred_11 ?v3 ?v12))))

(:action op_1
:parameters (?v12 ?v2)
:precondition (and (pred_6 ?v12) (pred_12 ?v2) 
                  (pred_9 ?v12) (pred_10 ?v2))
:effect (and (pred_7 ) (pred_11 ?v2 ?v12) (not (pred_10 ?v2)))))


	
