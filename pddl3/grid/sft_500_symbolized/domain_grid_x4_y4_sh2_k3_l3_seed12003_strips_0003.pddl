(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_8 ?v9 ?v13)
             (pred_7 ?v1 ?v12)
             (pred_6 ?v9 ?v12)
             (pred_2 ?v6 ?v9 )
	     (pred_11 ?v9)
             (pred_3 ?v8)
             (pred_9 ?v1)
             (pred_10 ?v12)
             (pred_4 ?v9)
             (pred_12 ?v1)
             (pred_1 ?v9)
             (pred_5 ))



(:action op_1
:parameters (?v5 ?v11 ?v4 ?v2)
:precondition (and (pred_3 ?v5) (pred_3 ?v11) (pred_9 ?v4) (pred_10 ?v2)
          (pred_8 ?v5 ?v11) (pred_7 ?v4 ?v2)
                   (pred_6 ?v11 ?v2) (pred_11 ?v5) 
                   (pred_4 ?v11) (pred_12 ?v4))
:effect (and  (pred_1 ?v11) (not (pred_4 ?v11))))


(:action op_3
:parameters (?v5 ?v7)
:precondition (and (pred_3 ?v5) (pred_3 ?v7)
               (pred_11 ?v5) (pred_8 ?v5 ?v7) (pred_1 ?v7))
:effect (and (pred_11 ?v7) (not (pred_11 ?v5))))

(:action op_5
:parameters (?v5 ?v4)
:precondition (and (pred_3 ?v5) (pred_9 ?v4) 
                  (pred_11 ?v5) (pred_2 ?v4 ?v5) (pred_5 ))
:effect (and (pred_12 ?v4)
   (not (pred_2 ?v4 ?v5)) (not (pred_5 ))))


(:action op_2
:parameters (?v5 ?v3 ?v10)
:precondition (and (pred_3 ?v5) (pred_9 ?v3) (pred_9 ?v10)
                  (pred_11 ?v5) (pred_12 ?v10) (pred_2 ?v3 ?v5))
:effect (and (pred_12 ?v3) (pred_2 ?v10 ?v5)
        (not (pred_12 ?v10)) (not (pred_2 ?v3 ?v5))))

(:action op_4
:parameters (?v5 ?v4)
:precondition (and (pred_3 ?v5) (pred_9 ?v4) 
                  (pred_11 ?v5) (pred_12 ?v4))
:effect (and (pred_5 ) (pred_2 ?v4 ?v5) (not (pred_12 ?v4)))))


	
