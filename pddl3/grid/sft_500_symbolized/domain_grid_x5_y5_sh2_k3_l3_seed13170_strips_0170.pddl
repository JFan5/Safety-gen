(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_7 ?v2 ?v5)
             (pred_9 ?v13 ?v6)
             (pred_10 ?v2 ?v6)
             (pred_5 ?v4 ?v2 )
	     (pred_4 ?v2)
             (pred_6 ?v10)
             (pred_2 ?v13)
             (pred_12 ?v6)
             (pred_8 ?v2)
             (pred_11 ?v13)
             (pred_1 ?v2)
             (pred_3 ))



(:action op_2
:parameters (?v11 ?v8 ?v1 ?v3)
:precondition (and (pred_6 ?v11) (pred_6 ?v8) (pred_2 ?v1) (pred_12 ?v3)
          (pred_7 ?v11 ?v8) (pred_9 ?v1 ?v3)
                   (pred_10 ?v8 ?v3) (pred_4 ?v11) 
                   (pred_8 ?v8) (pred_11 ?v1))
:effect (and  (pred_1 ?v8) (not (pred_8 ?v8))))


(:action op_3
:parameters (?v11 ?v9)
:precondition (and (pred_6 ?v11) (pred_6 ?v9)
               (pred_4 ?v11) (pred_7 ?v11 ?v9) (pred_1 ?v9))
:effect (and (pred_4 ?v9) (not (pred_4 ?v11))))

(:action op_5
:parameters (?v11 ?v1)
:precondition (and (pred_6 ?v11) (pred_2 ?v1) 
                  (pred_4 ?v11) (pred_5 ?v1 ?v11) (pred_3 ))
:effect (and (pred_11 ?v1)
   (not (pred_5 ?v1 ?v11)) (not (pred_3 ))))


(:action op_1
:parameters (?v11 ?v12 ?v7)
:precondition (and (pred_6 ?v11) (pred_2 ?v12) (pred_2 ?v7)
                  (pred_4 ?v11) (pred_11 ?v7) (pred_5 ?v12 ?v11))
:effect (and (pred_11 ?v12) (pred_5 ?v7 ?v11)
        (not (pred_11 ?v7)) (not (pred_5 ?v12 ?v11))))

(:action op_4
:parameters (?v11 ?v1)
:precondition (and (pred_6 ?v11) (pred_2 ?v1) 
                  (pred_4 ?v11) (pred_11 ?v1))
:effect (and (pred_3 ) (pred_5 ?v1 ?v11) (not (pred_11 ?v1)))))


	
