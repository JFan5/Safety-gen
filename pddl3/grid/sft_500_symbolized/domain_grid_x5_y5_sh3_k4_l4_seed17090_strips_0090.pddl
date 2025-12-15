(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_5 ?v5 ?v6)
             (pred_7 ?v2 ?v7)
             (pred_2 ?v5 ?v7)
             (pred_8 ?v4 ?v5 )
	     (pred_10 ?v5)
             (pred_1 ?v11)
             (pred_11 ?v2)
             (pred_12 ?v7)
             (pred_4 ?v5)
             (pred_6 ?v2)
             (pred_3 ?v5)
             (pred_9 ))



(:action op_1
:parameters (?v12 ?v10 ?v13 ?v3)
:precondition (and (pred_1 ?v12) (pred_1 ?v10) (pred_11 ?v13) (pred_12 ?v3)
          (pred_5 ?v12 ?v10) (pred_7 ?v13 ?v3)
                   (pred_2 ?v10 ?v3) (pred_10 ?v12) 
                   (pred_4 ?v10) (pred_6 ?v13))
:effect (and  (pred_3 ?v10) (not (pred_4 ?v10))))


(:action op_4
:parameters (?v12 ?v9)
:precondition (and (pred_1 ?v12) (pred_1 ?v9)
               (pred_10 ?v12) (pred_5 ?v12 ?v9) (pred_3 ?v9))
:effect (and (pred_10 ?v9) (not (pred_10 ?v12))))

(:action op_2
:parameters (?v12 ?v13)
:precondition (and (pred_1 ?v12) (pred_11 ?v13) 
                  (pred_10 ?v12) (pred_8 ?v13 ?v12) (pred_9 ))
:effect (and (pred_6 ?v13)
   (not (pred_8 ?v13 ?v12)) (not (pred_9 ))))


(:action op_3
:parameters (?v12 ?v1 ?v8)
:precondition (and (pred_1 ?v12) (pred_11 ?v1) (pred_11 ?v8)
                  (pred_10 ?v12) (pred_6 ?v8) (pred_8 ?v1 ?v12))
:effect (and (pred_6 ?v1) (pred_8 ?v8 ?v12)
        (not (pred_6 ?v8)) (not (pred_8 ?v1 ?v12))))

(:action op_5
:parameters (?v12 ?v13)
:precondition (and (pred_1 ?v12) (pred_11 ?v13) 
                  (pred_10 ?v12) (pred_6 ?v13))
:effect (and (pred_9 ) (pred_8 ?v13 ?v12) (not (pred_6 ?v13)))))


	
