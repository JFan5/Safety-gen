(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_6 ?v9 ?v12)
             (pred_7 ?v4 ?v2)
             (pred_9 ?v9 ?v2)
             (pred_5 ?v7 ?v9 )
	     (pred_1 ?v9)
             (pred_3 ?v13)
             (pred_11 ?v4)
             (pred_10 ?v2)
             (pred_4 ?v9)
             (pred_12 ?v4)
             (pred_8 ?v9)
             (pred_2 ))



(:action op_3
:parameters (?v10 ?v8 ?v5 ?v3)
:precondition (and (pred_3 ?v10) (pred_3 ?v8) (pred_11 ?v5) (pred_10 ?v3)
          (pred_6 ?v10 ?v8) (pred_7 ?v5 ?v3)
                   (pred_9 ?v8 ?v3) (pred_1 ?v10) 
                   (pred_4 ?v8) (pred_12 ?v5))
:effect (and  (pred_8 ?v8) (not (pred_4 ?v8))))


(:action op_1
:parameters (?v10 ?v1)
:precondition (and (pred_3 ?v10) (pred_3 ?v1)
               (pred_1 ?v10) (pred_6 ?v10 ?v1) (pred_8 ?v1))
:effect (and (pred_1 ?v1) (not (pred_1 ?v10))))

(:action op_4
:parameters (?v10 ?v5)
:precondition (and (pred_3 ?v10) (pred_11 ?v5) 
                  (pred_1 ?v10) (pred_5 ?v5 ?v10) (pred_2 ))
:effect (and (pred_12 ?v5)
   (not (pred_5 ?v5 ?v10)) (not (pred_2 ))))


(:action op_5
:parameters (?v10 ?v11 ?v6)
:precondition (and (pred_3 ?v10) (pred_11 ?v11) (pred_11 ?v6)
                  (pred_1 ?v10) (pred_12 ?v6) (pred_5 ?v11 ?v10))
:effect (and (pred_12 ?v11) (pred_5 ?v6 ?v10)
        (not (pred_12 ?v6)) (not (pred_5 ?v11 ?v10))))

(:action op_2
:parameters (?v10 ?v5)
:precondition (and (pred_3 ?v10) (pred_11 ?v5) 
                  (pred_1 ?v10) (pred_12 ?v5))
:effect (and (pred_2 ) (pred_5 ?v5 ?v10) (not (pred_12 ?v5)))))


	
