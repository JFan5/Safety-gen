(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_9 ?v3 ?v6)
             (pred_12 ?v13 ?v7)
             (pred_3 ?v3 ?v7)
             (pred_4 ?v4 ?v3 )
	     (pred_6 ?v3)
             (pred_2 ?v12)
             (pred_1 ?v13)
             (pred_11 ?v7)
             (pred_10 ?v3)
             (pred_8 ?v13)
             (pred_7 ?v3)
             (pred_5 ))



(:action op_3
:parameters (?v8 ?v11 ?v10 ?v5)
:precondition (and (pred_2 ?v8) (pred_2 ?v11) (pred_1 ?v10) (pred_11 ?v5)
          (pred_9 ?v8 ?v11) (pred_12 ?v10 ?v5)
                   (pred_3 ?v11 ?v5) (pred_6 ?v8) 
                   (pred_10 ?v11) (pred_8 ?v10))
:effect (and  (pred_7 ?v11) (not (pred_10 ?v11))))


(:action op_4
:parameters (?v8 ?v1)
:precondition (and (pred_2 ?v8) (pred_2 ?v1)
               (pred_6 ?v8) (pred_9 ?v8 ?v1) (pred_7 ?v1))
:effect (and (pred_6 ?v1) (not (pred_6 ?v8))))

(:action op_1
:parameters (?v8 ?v10)
:precondition (and (pred_2 ?v8) (pred_1 ?v10) 
                  (pred_6 ?v8) (pred_4 ?v10 ?v8) (pred_5 ))
:effect (and (pred_8 ?v10)
   (not (pred_4 ?v10 ?v8)) (not (pred_5 ))))


(:action op_2
:parameters (?v8 ?v9 ?v2)
:precondition (and (pred_2 ?v8) (pred_1 ?v9) (pred_1 ?v2)
                  (pred_6 ?v8) (pred_8 ?v2) (pred_4 ?v9 ?v8))
:effect (and (pred_8 ?v9) (pred_4 ?v2 ?v8)
        (not (pred_8 ?v2)) (not (pred_4 ?v9 ?v8))))

(:action op_5
:parameters (?v8 ?v10)
:precondition (and (pred_2 ?v8) (pred_1 ?v10) 
                  (pred_6 ?v8) (pred_8 ?v10))
:effect (and (pred_5 ) (pred_4 ?v10 ?v8) (not (pred_8 ?v10)))))


	
