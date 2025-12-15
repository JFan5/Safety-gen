(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_9 ?v12 ?v5)
             (pred_5 ?v3 ?v2)
             (pred_4 ?v12 ?v2)
             (pred_11 ?v10 ?v12 )
	     (pred_3 ?v12)
             (pred_12 ?v4)
             (pred_1 ?v3)
             (pred_8 ?v2)
             (pred_7 ?v12)
             (pred_6 ?v3)
             (pred_10 ?v12)
             (pred_2 ))



(:action op_3
:parameters (?v11 ?v8 ?v1 ?v13)
:precondition (and (pred_12 ?v11) (pred_12 ?v8) (pred_1 ?v1) (pred_8 ?v13)
          (pred_9 ?v11 ?v8) (pred_5 ?v1 ?v13)
                   (pred_4 ?v8 ?v13) (pred_3 ?v11) 
                   (pred_7 ?v8) (pred_6 ?v1))
:effect (and  (pred_10 ?v8) (not (pred_7 ?v8))))


(:action op_1
:parameters (?v11 ?v6)
:precondition (and (pred_12 ?v11) (pred_12 ?v6)
               (pred_3 ?v11) (pred_9 ?v11 ?v6) (pred_10 ?v6))
:effect (and (pred_3 ?v6) (not (pred_3 ?v11))))

(:action op_2
:parameters (?v11 ?v1)
:precondition (and (pred_12 ?v11) (pred_1 ?v1) 
                  (pred_3 ?v11) (pred_11 ?v1 ?v11) (pred_2 ))
:effect (and (pred_6 ?v1)
   (not (pred_11 ?v1 ?v11)) (not (pred_2 ))))


(:action op_5
:parameters (?v11 ?v7 ?v9)
:precondition (and (pred_12 ?v11) (pred_1 ?v7) (pred_1 ?v9)
                  (pred_3 ?v11) (pred_6 ?v9) (pred_11 ?v7 ?v11))
:effect (and (pred_6 ?v7) (pred_11 ?v9 ?v11)
        (not (pred_6 ?v9)) (not (pred_11 ?v7 ?v11))))

(:action op_4
:parameters (?v11 ?v1)
:precondition (and (pred_12 ?v11) (pred_1 ?v1) 
                  (pred_3 ?v11) (pred_6 ?v1))
:effect (and (pred_2 ) (pred_11 ?v1 ?v11) (not (pred_6 ?v1)))))


	
