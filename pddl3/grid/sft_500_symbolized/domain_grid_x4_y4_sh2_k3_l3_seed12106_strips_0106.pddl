(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_11 ?v4 ?v12)
             (pred_2 ?v11 ?v5)
             (pred_12 ?v4 ?v5)
             (pred_8 ?v7 ?v4 )
	     (pred_4 ?v4)
             (pred_7 ?v13)
             (pred_1 ?v11)
             (pred_3 ?v5)
             (pred_5 ?v4)
             (pred_6 ?v11)
             (pred_9 ?v4)
             (pred_10 ))



(:action op_2
:parameters (?v10 ?v8 ?v6 ?v2)
:precondition (and (pred_7 ?v10) (pred_7 ?v8) (pred_1 ?v6) (pred_3 ?v2)
          (pred_11 ?v10 ?v8) (pred_2 ?v6 ?v2)
                   (pred_12 ?v8 ?v2) (pred_4 ?v10) 
                   (pred_5 ?v8) (pred_6 ?v6))
:effect (and  (pred_9 ?v8) (not (pred_5 ?v8))))


(:action op_1
:parameters (?v10 ?v1)
:precondition (and (pred_7 ?v10) (pred_7 ?v1)
               (pred_4 ?v10) (pred_11 ?v10 ?v1) (pred_9 ?v1))
:effect (and (pred_4 ?v1) (not (pred_4 ?v10))))

(:action op_5
:parameters (?v10 ?v6)
:precondition (and (pred_7 ?v10) (pred_1 ?v6) 
                  (pred_4 ?v10) (pred_8 ?v6 ?v10) (pred_10 ))
:effect (and (pred_6 ?v6)
   (not (pred_8 ?v6 ?v10)) (not (pred_10 ))))


(:action op_4
:parameters (?v10 ?v9 ?v3)
:precondition (and (pred_7 ?v10) (pred_1 ?v9) (pred_1 ?v3)
                  (pred_4 ?v10) (pred_6 ?v3) (pred_8 ?v9 ?v10))
:effect (and (pred_6 ?v9) (pred_8 ?v3 ?v10)
        (not (pred_6 ?v3)) (not (pred_8 ?v9 ?v10))))

(:action op_3
:parameters (?v10 ?v6)
:precondition (and (pred_7 ?v10) (pred_1 ?v6) 
                  (pred_4 ?v10) (pred_6 ?v6))
:effect (and (pred_10 ) (pred_8 ?v6 ?v10) (not (pred_6 ?v6)))))


	
