(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_10 ?v8 ?v10)
             (pred_7 ?v2 ?v6)
             (pred_5 ?v8 ?v6)
             (pred_2 ?v9 ?v8 )
	     (pred_8 ?v8)
             (pred_1 ?v13)
             (pred_3 ?v2)
             (pred_4 ?v6)
             (pred_12 ?v8)
             (pred_11 ?v2)
             (pred_6 ?v8)
             (pred_9 ))



(:action op_3
:parameters (?v5 ?v11 ?v1 ?v3)
:precondition (and (pred_1 ?v5) (pred_1 ?v11) (pred_3 ?v1) (pred_4 ?v3)
          (pred_10 ?v5 ?v11) (pred_7 ?v1 ?v3)
                   (pred_5 ?v11 ?v3) (pred_8 ?v5) 
                   (pred_12 ?v11) (pred_11 ?v1))
:effect (and  (pred_6 ?v11) (not (pred_12 ?v11))))


(:action op_2
:parameters (?v5 ?v7)
:precondition (and (pred_1 ?v5) (pred_1 ?v7)
               (pred_8 ?v5) (pred_10 ?v5 ?v7) (pred_6 ?v7))
:effect (and (pred_8 ?v7) (not (pred_8 ?v5))))

(:action op_5
:parameters (?v5 ?v1)
:precondition (and (pred_1 ?v5) (pred_3 ?v1) 
                  (pred_8 ?v5) (pred_2 ?v1 ?v5) (pred_9 ))
:effect (and (pred_11 ?v1)
   (not (pred_2 ?v1 ?v5)) (not (pred_9 ))))


(:action op_4
:parameters (?v5 ?v4 ?v12)
:precondition (and (pred_1 ?v5) (pred_3 ?v4) (pred_3 ?v12)
                  (pred_8 ?v5) (pred_11 ?v12) (pred_2 ?v4 ?v5))
:effect (and (pred_11 ?v4) (pred_2 ?v12 ?v5)
        (not (pred_11 ?v12)) (not (pred_2 ?v4 ?v5))))

(:action op_1
:parameters (?v5 ?v1)
:precondition (and (pred_1 ?v5) (pred_3 ?v1) 
                  (pred_8 ?v5) (pred_11 ?v1))
:effect (and (pred_9 ) (pred_2 ?v1 ?v5) (not (pred_11 ?v1)))))


	
