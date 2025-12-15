(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_3 ?v9 ?v8)
             (pred_6 ?v3 ?v7)
             (pred_10 ?v9 ?v7)
             (pred_5 ?v2 ?v9 )
	     (pred_11 ?v9)
             (pred_12 ?v10)
             (pred_4 ?v3)
             (pred_8 ?v7)
             (pred_9 ?v9)
             (pred_1 ?v3)
             (pred_7 ?v9)
             (pred_2 ))



(:action op_3
:parameters (?v11 ?v13 ?v5 ?v4)
:precondition (and (pred_12 ?v11) (pred_12 ?v13) (pred_4 ?v5) (pred_8 ?v4)
          (pred_3 ?v11 ?v13) (pred_6 ?v5 ?v4)
                   (pred_10 ?v13 ?v4) (pred_11 ?v11) 
                   (pred_9 ?v13) (pred_1 ?v5))
:effect (and  (pred_7 ?v13) (not (pred_9 ?v13))))


(:action op_4
:parameters (?v11 ?v1)
:precondition (and (pred_12 ?v11) (pred_12 ?v1)
               (pred_11 ?v11) (pred_3 ?v11 ?v1) (pred_7 ?v1))
:effect (and (pred_11 ?v1) (not (pred_11 ?v11))))

(:action op_2
:parameters (?v11 ?v5)
:precondition (and (pred_12 ?v11) (pred_4 ?v5) 
                  (pred_11 ?v11) (pred_5 ?v5 ?v11) (pred_2 ))
:effect (and (pred_1 ?v5)
   (not (pred_5 ?v5 ?v11)) (not (pred_2 ))))


(:action op_1
:parameters (?v11 ?v6 ?v12)
:precondition (and (pred_12 ?v11) (pred_4 ?v6) (pred_4 ?v12)
                  (pred_11 ?v11) (pred_1 ?v12) (pred_5 ?v6 ?v11))
:effect (and (pred_1 ?v6) (pred_5 ?v12 ?v11)
        (not (pred_1 ?v12)) (not (pred_5 ?v6 ?v11))))

(:action op_5
:parameters (?v11 ?v5)
:precondition (and (pred_12 ?v11) (pred_4 ?v5) 
                  (pred_11 ?v11) (pred_1 ?v5))
:effect (and (pred_2 ) (pred_5 ?v5 ?v11) (not (pred_1 ?v5)))))


	
