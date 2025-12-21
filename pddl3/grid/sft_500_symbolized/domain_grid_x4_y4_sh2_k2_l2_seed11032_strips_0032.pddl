(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_3 ?v2 ?v3)
             (pred_10 ?v12 ?v4)
             (pred_7 ?v2 ?v4)
             (pred_2 ?v10 ?v2 )
	     (pred_5 ?v2)
             (pred_6 ?v8)
             (pred_8 ?v12)
             (pred_11 ?v4)
             (pred_9 ?v2)
             (pred_4 ?v12)
             (pred_12 ?v2)
             (pred_1 ))



(:action op_4
:parameters (?v5 ?v11 ?v1 ?v6)
:precondition (and (pred_6 ?v5) (pred_6 ?v11) (pred_8 ?v1) (pred_11 ?v6)
          (pred_3 ?v5 ?v11) (pred_10 ?v1 ?v6)
                   (pred_7 ?v11 ?v6) (pred_5 ?v5) 
                   (pred_9 ?v11) (pred_4 ?v1))
:effect (and  (pred_12 ?v11) (not (pred_9 ?v11))))


(:action op_5
:parameters (?v5 ?v13)
:precondition (and (pred_6 ?v5) (pred_6 ?v13)
               (pred_5 ?v5) (pred_3 ?v5 ?v13) (pred_12 ?v13))
:effect (and (pred_5 ?v13) (not (pred_5 ?v5))))

(:action op_1
:parameters (?v5 ?v1)
:precondition (and (pred_6 ?v5) (pred_8 ?v1) 
                  (pred_5 ?v5) (pred_2 ?v1 ?v5) (pred_1 ))
:effect (and (pred_4 ?v1)
   (not (pred_2 ?v1 ?v5)) (not (pred_1 ))))


(:action op_3
:parameters (?v5 ?v7 ?v9)
:precondition (and (pred_6 ?v5) (pred_8 ?v7) (pred_8 ?v9)
                  (pred_5 ?v5) (pred_4 ?v9) (pred_2 ?v7 ?v5))
:effect (and (pred_4 ?v7) (pred_2 ?v9 ?v5)
        (not (pred_4 ?v9)) (not (pred_2 ?v7 ?v5))))

(:action op_2
:parameters (?v5 ?v1)
:precondition (and (pred_6 ?v5) (pred_8 ?v1) 
                  (pred_5 ?v5) (pred_4 ?v1))
:effect (and (pred_1 ) (pred_2 ?v1 ?v5) (not (pred_4 ?v1)))))


	
