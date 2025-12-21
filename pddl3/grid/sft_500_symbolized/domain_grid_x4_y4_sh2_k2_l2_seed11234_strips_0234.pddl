(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_2 ?v7 ?v9)
             (pred_7 ?v12 ?v3)
             (pred_9 ?v7 ?v3)
             (pred_10 ?v6 ?v7 )
	     (pred_8 ?v7)
             (pred_5 ?v4)
             (pred_4 ?v12)
             (pred_3 ?v3)
             (pred_1 ?v7)
             (pred_12 ?v12)
             (pred_6 ?v7)
             (pred_11 ))



(:action op_2
:parameters (?v10 ?v2 ?v1 ?v5)
:precondition (and (pred_5 ?v10) (pred_5 ?v2) (pred_4 ?v1) (pred_3 ?v5)
          (pred_2 ?v10 ?v2) (pred_7 ?v1 ?v5)
                   (pred_9 ?v2 ?v5) (pred_8 ?v10) 
                   (pred_1 ?v2) (pred_12 ?v1))
:effect (and  (pred_6 ?v2) (not (pred_1 ?v2))))


(:action op_4
:parameters (?v10 ?v11)
:precondition (and (pred_5 ?v10) (pred_5 ?v11)
               (pred_8 ?v10) (pred_2 ?v10 ?v11) (pred_6 ?v11))
:effect (and (pred_8 ?v11) (not (pred_8 ?v10))))

(:action op_5
:parameters (?v10 ?v1)
:precondition (and (pred_5 ?v10) (pred_4 ?v1) 
                  (pred_8 ?v10) (pred_10 ?v1 ?v10) (pred_11 ))
:effect (and (pred_12 ?v1)
   (not (pred_10 ?v1 ?v10)) (not (pred_11 ))))


(:action op_3
:parameters (?v10 ?v8 ?v13)
:precondition (and (pred_5 ?v10) (pred_4 ?v8) (pred_4 ?v13)
                  (pred_8 ?v10) (pred_12 ?v13) (pred_10 ?v8 ?v10))
:effect (and (pred_12 ?v8) (pred_10 ?v13 ?v10)
        (not (pred_12 ?v13)) (not (pred_10 ?v8 ?v10))))

(:action op_1
:parameters (?v10 ?v1)
:precondition (and (pred_5 ?v10) (pred_4 ?v1) 
                  (pred_8 ?v10) (pred_12 ?v1))
:effect (and (pred_11 ) (pred_10 ?v1 ?v10) (not (pred_12 ?v1)))))


	
