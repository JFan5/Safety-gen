(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_1 ?v11 ?v9)
             (pred_4 ?v5 ?v12)
             (pred_9 ?v11 ?v12)
             (pred_6 ?v10 ?v11 )
	     (pred_7 ?v11)
             (pred_11 ?v4)
             (pred_3 ?v5)
             (pred_2 ?v12)
             (pred_5 ?v11)
             (pred_10 ?v5)
             (pred_12 ?v11)
             (pred_8 ))



(:action op_1
:parameters (?v8 ?v3 ?v6 ?v13)
:precondition (and (pred_11 ?v8) (pred_11 ?v3) (pred_3 ?v6) (pred_2 ?v13)
          (pred_1 ?v8 ?v3) (pred_4 ?v6 ?v13)
                   (pred_9 ?v3 ?v13) (pred_7 ?v8) 
                   (pred_5 ?v3) (pred_10 ?v6))
:effect (and  (pred_12 ?v3) (not (pred_5 ?v3))))


(:action op_2
:parameters (?v8 ?v2)
:precondition (and (pred_11 ?v8) (pred_11 ?v2)
               (pred_7 ?v8) (pred_1 ?v8 ?v2) (pred_12 ?v2))
:effect (and (pred_7 ?v2) (not (pred_7 ?v8))))

(:action op_3
:parameters (?v8 ?v6)
:precondition (and (pred_11 ?v8) (pred_3 ?v6) 
                  (pred_7 ?v8) (pred_6 ?v6 ?v8) (pred_8 ))
:effect (and (pred_10 ?v6)
   (not (pred_6 ?v6 ?v8)) (not (pred_8 ))))


(:action op_5
:parameters (?v8 ?v1 ?v7)
:precondition (and (pred_11 ?v8) (pred_3 ?v1) (pred_3 ?v7)
                  (pred_7 ?v8) (pred_10 ?v7) (pred_6 ?v1 ?v8))
:effect (and (pred_10 ?v1) (pred_6 ?v7 ?v8)
        (not (pred_10 ?v7)) (not (pred_6 ?v1 ?v8))))

(:action op_4
:parameters (?v8 ?v6)
:precondition (and (pred_11 ?v8) (pred_3 ?v6) 
                  (pred_7 ?v8) (pred_10 ?v6))
:effect (and (pred_8 ) (pred_6 ?v6 ?v8) (not (pred_10 ?v6)))))


	
