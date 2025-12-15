(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_7 ?v5 ?v10)
             (pred_6 ?v2 ?v12)
             (pred_10 ?v5 ?v12)
             (pred_9 ?v3 ?v5 )
	     (pred_2 ?v5)
             (pred_11 ?v4)
             (pred_5 ?v2)
             (pred_1 ?v12)
             (pred_3 ?v5)
             (pred_12 ?v2)
             (pred_4 ?v5)
             (pred_8 ))



(:action op_3
:parameters (?v11 ?v8 ?v1 ?v7)
:precondition (and (pred_11 ?v11) (pred_11 ?v8) (pred_5 ?v1) (pred_1 ?v7)
          (pred_7 ?v11 ?v8) (pred_6 ?v1 ?v7)
                   (pred_10 ?v8 ?v7) (pred_2 ?v11) 
                   (pred_3 ?v8) (pred_12 ?v1))
:effect (and  (pred_4 ?v8) (not (pred_3 ?v8))))


(:action op_5
:parameters (?v11 ?v9)
:precondition (and (pred_11 ?v11) (pred_11 ?v9)
               (pred_2 ?v11) (pred_7 ?v11 ?v9) (pred_4 ?v9))
:effect (and (pred_2 ?v9) (not (pred_2 ?v11))))

(:action op_2
:parameters (?v11 ?v1)
:precondition (and (pred_11 ?v11) (pred_5 ?v1) 
                  (pred_2 ?v11) (pred_9 ?v1 ?v11) (pred_8 ))
:effect (and (pred_12 ?v1)
   (not (pred_9 ?v1 ?v11)) (not (pred_8 ))))


(:action op_4
:parameters (?v11 ?v13 ?v6)
:precondition (and (pred_11 ?v11) (pred_5 ?v13) (pred_5 ?v6)
                  (pred_2 ?v11) (pred_12 ?v6) (pred_9 ?v13 ?v11))
:effect (and (pred_12 ?v13) (pred_9 ?v6 ?v11)
        (not (pred_12 ?v6)) (not (pred_9 ?v13 ?v11))))

(:action op_1
:parameters (?v11 ?v1)
:precondition (and (pred_11 ?v11) (pred_5 ?v1) 
                  (pred_2 ?v11) (pred_12 ?v1))
:effect (and (pred_8 ) (pred_9 ?v1 ?v11) (not (pred_12 ?v1)))))


	
