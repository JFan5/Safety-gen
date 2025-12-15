(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_1 ?v6 ?v9)
             (pred_5 ?v4 ?v7)
             (pred_10 ?v6 ?v7)
             (pred_4 ?v12 ?v6 )
	     (pred_11 ?v6)
             (pred_12 ?v8)
             (pred_9 ?v4)
             (pred_2 ?v7)
             (pred_7 ?v6)
             (pred_3 ?v4)
             (pred_8 ?v6)
             (pred_6 ))



(:action op_1
:parameters (?v11 ?v2 ?v1 ?v13)
:precondition (and (pred_12 ?v11) (pred_12 ?v2) (pred_9 ?v1) (pred_2 ?v13)
          (pred_1 ?v11 ?v2) (pred_5 ?v1 ?v13)
                   (pred_10 ?v2 ?v13) (pred_11 ?v11) 
                   (pred_7 ?v2) (pred_3 ?v1))
:effect (and  (pred_8 ?v2) (not (pred_7 ?v2))))


(:action op_5
:parameters (?v11 ?v10)
:precondition (and (pred_12 ?v11) (pred_12 ?v10)
               (pred_11 ?v11) (pred_1 ?v11 ?v10) (pred_8 ?v10))
:effect (and (pred_11 ?v10) (not (pred_11 ?v11))))

(:action op_4
:parameters (?v11 ?v1)
:precondition (and (pred_12 ?v11) (pred_9 ?v1) 
                  (pred_11 ?v11) (pred_4 ?v1 ?v11) (pred_6 ))
:effect (and (pred_3 ?v1)
   (not (pred_4 ?v1 ?v11)) (not (pred_6 ))))


(:action op_2
:parameters (?v11 ?v3 ?v5)
:precondition (and (pred_12 ?v11) (pred_9 ?v3) (pred_9 ?v5)
                  (pred_11 ?v11) (pred_3 ?v5) (pred_4 ?v3 ?v11))
:effect (and (pred_3 ?v3) (pred_4 ?v5 ?v11)
        (not (pred_3 ?v5)) (not (pred_4 ?v3 ?v11))))

(:action op_3
:parameters (?v11 ?v1)
:precondition (and (pred_12 ?v11) (pred_9 ?v1) 
                  (pred_11 ?v11) (pred_3 ?v1))
:effect (and (pred_6 ) (pred_4 ?v1 ?v11) (not (pred_3 ?v1)))))


	
