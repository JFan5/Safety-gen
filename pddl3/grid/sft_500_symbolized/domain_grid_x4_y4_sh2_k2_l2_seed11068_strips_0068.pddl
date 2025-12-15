(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_5 ?v5 ?v4)
             (pred_10 ?v6 ?v1)
             (pred_6 ?v5 ?v1)
             (pred_3 ?v7 ?v5 )
	     (pred_7 ?v5)
             (pred_12 ?v8)
             (pred_1 ?v6)
             (pred_9 ?v1)
             (pred_2 ?v5)
             (pred_4 ?v6)
             (pred_11 ?v5)
             (pred_8 ))



(:action op_5
:parameters (?v12 ?v2 ?v9 ?v10)
:precondition (and (pred_12 ?v12) (pred_12 ?v2) (pred_1 ?v9) (pred_9 ?v10)
          (pred_5 ?v12 ?v2) (pred_10 ?v9 ?v10)
                   (pred_6 ?v2 ?v10) (pred_7 ?v12) 
                   (pred_2 ?v2) (pred_4 ?v9))
:effect (and  (pred_11 ?v2) (not (pred_2 ?v2))))


(:action op_1
:parameters (?v12 ?v13)
:precondition (and (pred_12 ?v12) (pred_12 ?v13)
               (pred_7 ?v12) (pred_5 ?v12 ?v13) (pred_11 ?v13))
:effect (and (pred_7 ?v13) (not (pred_7 ?v12))))

(:action op_3
:parameters (?v12 ?v9)
:precondition (and (pred_12 ?v12) (pred_1 ?v9) 
                  (pred_7 ?v12) (pred_3 ?v9 ?v12) (pred_8 ))
:effect (and (pred_4 ?v9)
   (not (pred_3 ?v9 ?v12)) (not (pred_8 ))))


(:action op_2
:parameters (?v12 ?v11 ?v3)
:precondition (and (pred_12 ?v12) (pred_1 ?v11) (pred_1 ?v3)
                  (pred_7 ?v12) (pred_4 ?v3) (pred_3 ?v11 ?v12))
:effect (and (pred_4 ?v11) (pred_3 ?v3 ?v12)
        (not (pred_4 ?v3)) (not (pred_3 ?v11 ?v12))))

(:action op_4
:parameters (?v12 ?v9)
:precondition (and (pred_12 ?v12) (pred_1 ?v9) 
                  (pred_7 ?v12) (pred_4 ?v9))
:effect (and (pred_8 ) (pred_3 ?v9 ?v12) (not (pred_4 ?v9)))))


	
