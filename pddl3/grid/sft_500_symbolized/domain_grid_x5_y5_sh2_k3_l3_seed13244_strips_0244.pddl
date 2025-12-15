(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_9 ?v7 ?v1)
             (pred_11 ?v11 ?v8)
             (pred_1 ?v7 ?v8)
             (pred_8 ?v9 ?v7 )
	     (pred_3 ?v7)
             (pred_4 ?v3)
             (pred_5 ?v11)
             (pred_6 ?v8)
             (pred_2 ?v7)
             (pred_12 ?v11)
             (pred_7 ?v7)
             (pred_10 ))



(:action op_5
:parameters (?v12 ?v13 ?v5 ?v4)
:precondition (and (pred_4 ?v12) (pred_4 ?v13) (pred_5 ?v5) (pred_6 ?v4)
          (pred_9 ?v12 ?v13) (pred_11 ?v5 ?v4)
                   (pred_1 ?v13 ?v4) (pred_3 ?v12) 
                   (pred_2 ?v13) (pred_12 ?v5))
:effect (and  (pred_7 ?v13) (not (pred_2 ?v13))))


(:action op_3
:parameters (?v12 ?v2)
:precondition (and (pred_4 ?v12) (pred_4 ?v2)
               (pred_3 ?v12) (pred_9 ?v12 ?v2) (pred_7 ?v2))
:effect (and (pred_3 ?v2) (not (pred_3 ?v12))))

(:action op_1
:parameters (?v12 ?v5)
:precondition (and (pred_4 ?v12) (pred_5 ?v5) 
                  (pred_3 ?v12) (pred_8 ?v5 ?v12) (pred_10 ))
:effect (and (pred_12 ?v5)
   (not (pred_8 ?v5 ?v12)) (not (pred_10 ))))


(:action op_2
:parameters (?v12 ?v10 ?v6)
:precondition (and (pred_4 ?v12) (pred_5 ?v10) (pred_5 ?v6)
                  (pred_3 ?v12) (pred_12 ?v6) (pred_8 ?v10 ?v12))
:effect (and (pred_12 ?v10) (pred_8 ?v6 ?v12)
        (not (pred_12 ?v6)) (not (pred_8 ?v10 ?v12))))

(:action op_4
:parameters (?v12 ?v5)
:precondition (and (pred_4 ?v12) (pred_5 ?v5) 
                  (pred_3 ?v12) (pred_12 ?v5))
:effect (and (pred_10 ) (pred_8 ?v5 ?v12) (not (pred_12 ?v5)))))


	
