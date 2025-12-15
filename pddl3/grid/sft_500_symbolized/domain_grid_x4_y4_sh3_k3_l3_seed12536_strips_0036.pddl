(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_7 ?v8 ?v3)
             (pred_9 ?v9 ?v2)
             (pred_4 ?v8 ?v2)
             (pred_10 ?v11 ?v8 )
	     (pred_3 ?v8)
             (pred_11 ?v6)
             (pred_8 ?v9)
             (pred_5 ?v2)
             (pred_6 ?v8)
             (pred_1 ?v9)
             (pred_2 ?v8)
             (pred_12 ))



(:action op_2
:parameters (?v10 ?v12 ?v13 ?v5)
:precondition (and (pred_11 ?v10) (pred_11 ?v12) (pred_8 ?v13) (pred_5 ?v5)
          (pred_7 ?v10 ?v12) (pred_9 ?v13 ?v5)
                   (pred_4 ?v12 ?v5) (pred_3 ?v10) 
                   (pred_6 ?v12) (pred_1 ?v13))
:effect (and  (pred_2 ?v12) (not (pred_6 ?v12))))


(:action op_1
:parameters (?v10 ?v4)
:precondition (and (pred_11 ?v10) (pred_11 ?v4)
               (pred_3 ?v10) (pred_7 ?v10 ?v4) (pred_2 ?v4))
:effect (and (pred_3 ?v4) (not (pred_3 ?v10))))

(:action op_3
:parameters (?v10 ?v13)
:precondition (and (pred_11 ?v10) (pred_8 ?v13) 
                  (pred_3 ?v10) (pred_10 ?v13 ?v10) (pred_12 ))
:effect (and (pred_1 ?v13)
   (not (pred_10 ?v13 ?v10)) (not (pred_12 ))))


(:action op_5
:parameters (?v10 ?v1 ?v7)
:precondition (and (pred_11 ?v10) (pred_8 ?v1) (pred_8 ?v7)
                  (pred_3 ?v10) (pred_1 ?v7) (pred_10 ?v1 ?v10))
:effect (and (pred_1 ?v1) (pred_10 ?v7 ?v10)
        (not (pred_1 ?v7)) (not (pred_10 ?v1 ?v10))))

(:action op_4
:parameters (?v10 ?v13)
:precondition (and (pred_11 ?v10) (pred_8 ?v13) 
                  (pred_3 ?v10) (pred_1 ?v13))
:effect (and (pred_12 ) (pred_10 ?v13 ?v10) (not (pred_1 ?v13)))))


	
