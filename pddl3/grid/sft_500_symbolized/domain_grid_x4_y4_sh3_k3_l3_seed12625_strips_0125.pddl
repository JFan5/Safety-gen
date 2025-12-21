(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_6 ?v6 ?v11)
             (pred_8 ?v5 ?v10)
             (pred_12 ?v6 ?v10)
             (pred_9 ?v7 ?v6 )
	     (pred_3 ?v6)
             (pred_5 ?v1)
             (pred_4 ?v5)
             (pred_10 ?v10)
             (pred_7 ?v6)
             (pred_2 ?v5)
             (pred_1 ?v6)
             (pred_11 ))



(:action op_3
:parameters (?v12 ?v13 ?v3 ?v8)
:precondition (and (pred_5 ?v12) (pred_5 ?v13) (pred_4 ?v3) (pred_10 ?v8)
          (pred_6 ?v12 ?v13) (pred_8 ?v3 ?v8)
                   (pred_12 ?v13 ?v8) (pred_3 ?v12) 
                   (pred_7 ?v13) (pred_2 ?v3))
:effect (and  (pred_1 ?v13) (not (pred_7 ?v13))))


(:action op_2
:parameters (?v12 ?v2)
:precondition (and (pred_5 ?v12) (pred_5 ?v2)
               (pred_3 ?v12) (pred_6 ?v12 ?v2) (pred_1 ?v2))
:effect (and (pred_3 ?v2) (not (pred_3 ?v12))))

(:action op_4
:parameters (?v12 ?v3)
:precondition (and (pred_5 ?v12) (pred_4 ?v3) 
                  (pred_3 ?v12) (pred_9 ?v3 ?v12) (pred_11 ))
:effect (and (pred_2 ?v3)
   (not (pred_9 ?v3 ?v12)) (not (pred_11 ))))


(:action op_5
:parameters (?v12 ?v4 ?v9)
:precondition (and (pred_5 ?v12) (pred_4 ?v4) (pred_4 ?v9)
                  (pred_3 ?v12) (pred_2 ?v9) (pred_9 ?v4 ?v12))
:effect (and (pred_2 ?v4) (pred_9 ?v9 ?v12)
        (not (pred_2 ?v9)) (not (pred_9 ?v4 ?v12))))

(:action op_1
:parameters (?v12 ?v3)
:precondition (and (pred_5 ?v12) (pred_4 ?v3) 
                  (pred_3 ?v12) (pred_2 ?v3))
:effect (and (pred_11 ) (pred_9 ?v3 ?v12) (not (pred_2 ?v3)))))


	
