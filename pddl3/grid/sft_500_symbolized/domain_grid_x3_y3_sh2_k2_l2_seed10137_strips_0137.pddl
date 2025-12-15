(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_4 ?v8 ?v12)
             (pred_7 ?v7 ?v3)
             (pred_5 ?v8 ?v3)
             (pred_12 ?v9 ?v8 )
	     (pred_10 ?v8)
             (pred_9 ?v5)
             (pred_2 ?v7)
             (pred_8 ?v3)
             (pred_3 ?v8)
             (pred_1 ?v7)
             (pred_11 ?v8)
             (pred_6 ))



(:action op_2
:parameters (?v11 ?v10 ?v6 ?v13)
:precondition (and (pred_9 ?v11) (pred_9 ?v10) (pred_2 ?v6) (pred_8 ?v13)
          (pred_4 ?v11 ?v10) (pred_7 ?v6 ?v13)
                   (pred_5 ?v10 ?v13) (pred_10 ?v11) 
                   (pred_3 ?v10) (pred_1 ?v6))
:effect (and  (pred_11 ?v10) (not (pred_3 ?v10))))


(:action op_5
:parameters (?v11 ?v1)
:precondition (and (pred_9 ?v11) (pred_9 ?v1)
               (pred_10 ?v11) (pred_4 ?v11 ?v1) (pred_11 ?v1))
:effect (and (pred_10 ?v1) (not (pred_10 ?v11))))

(:action op_3
:parameters (?v11 ?v6)
:precondition (and (pred_9 ?v11) (pred_2 ?v6) 
                  (pred_10 ?v11) (pred_12 ?v6 ?v11) (pred_6 ))
:effect (and (pred_1 ?v6)
   (not (pred_12 ?v6 ?v11)) (not (pred_6 ))))


(:action op_1
:parameters (?v11 ?v2 ?v4)
:precondition (and (pred_9 ?v11) (pred_2 ?v2) (pred_2 ?v4)
                  (pred_10 ?v11) (pred_1 ?v4) (pred_12 ?v2 ?v11))
:effect (and (pred_1 ?v2) (pred_12 ?v4 ?v11)
        (not (pred_1 ?v4)) (not (pred_12 ?v2 ?v11))))

(:action op_4
:parameters (?v11 ?v6)
:precondition (and (pred_9 ?v11) (pred_2 ?v6) 
                  (pred_10 ?v11) (pred_1 ?v6))
:effect (and (pred_6 ) (pred_12 ?v6 ?v11) (not (pred_1 ?v6)))))


	
