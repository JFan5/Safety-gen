(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_3 ?v5 ?v4)
             (pred_4 ?v7 ?v1)
             (pred_5 ?v5 ?v1)
             (pred_10 ?v12 ?v5 )
	     (pred_1 ?v5)
             (pred_8 ?v2)
             (pred_2 ?v7)
             (pred_9 ?v1)
             (pred_11 ?v5)
             (pred_12 ?v7)
             (pred_7 ?v5)
             (pred_6 ))



(:action op_2
:parameters (?v8 ?v11 ?v10 ?v9)
:precondition (and (pred_8 ?v8) (pred_8 ?v11) (pred_2 ?v10) (pred_9 ?v9)
          (pred_3 ?v8 ?v11) (pred_4 ?v10 ?v9)
                   (pred_5 ?v11 ?v9) (pred_1 ?v8) 
                   (pred_11 ?v11) (pred_12 ?v10))
:effect (and  (pred_7 ?v11) (not (pred_11 ?v11))))


(:action op_1
:parameters (?v8 ?v6)
:precondition (and (pred_8 ?v8) (pred_8 ?v6)
               (pred_1 ?v8) (pred_3 ?v8 ?v6) (pred_7 ?v6))
:effect (and (pred_1 ?v6) (not (pred_1 ?v8))))

(:action op_4
:parameters (?v8 ?v10)
:precondition (and (pred_8 ?v8) (pred_2 ?v10) 
                  (pred_1 ?v8) (pred_10 ?v10 ?v8) (pred_6 ))
:effect (and (pred_12 ?v10)
   (not (pred_10 ?v10 ?v8)) (not (pred_6 ))))


(:action op_5
:parameters (?v8 ?v3 ?v13)
:precondition (and (pred_8 ?v8) (pred_2 ?v3) (pred_2 ?v13)
                  (pred_1 ?v8) (pred_12 ?v13) (pred_10 ?v3 ?v8))
:effect (and (pred_12 ?v3) (pred_10 ?v13 ?v8)
        (not (pred_12 ?v13)) (not (pred_10 ?v3 ?v8))))

(:action op_3
:parameters (?v8 ?v10)
:precondition (and (pred_8 ?v8) (pred_2 ?v10) 
                  (pred_1 ?v8) (pred_12 ?v10))
:effect (and (pred_6 ) (pred_10 ?v10 ?v8) (not (pred_12 ?v10)))))


	
