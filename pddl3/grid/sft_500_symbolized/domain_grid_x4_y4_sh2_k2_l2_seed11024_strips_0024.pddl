(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_1 ?v11 ?v9)
             (pred_2 ?v2 ?v6)
             (pred_5 ?v11 ?v6)
             (pred_8 ?v3 ?v11 )
	     (pred_12 ?v11)
             (pred_4 ?v10)
             (pred_7 ?v2)
             (pred_3 ?v6)
             (pred_11 ?v11)
             (pred_6 ?v2)
             (pred_9 ?v11)
             (pred_10 ))



(:action op_5
:parameters (?v5 ?v1 ?v7 ?v8)
:precondition (and (pred_4 ?v5) (pred_4 ?v1) (pred_7 ?v7) (pred_3 ?v8)
          (pred_1 ?v5 ?v1) (pred_2 ?v7 ?v8)
                   (pred_5 ?v1 ?v8) (pred_12 ?v5) 
                   (pred_11 ?v1) (pred_6 ?v7))
:effect (and  (pred_9 ?v1) (not (pred_11 ?v1))))


(:action op_2
:parameters (?v5 ?v12)
:precondition (and (pred_4 ?v5) (pred_4 ?v12)
               (pred_12 ?v5) (pred_1 ?v5 ?v12) (pred_9 ?v12))
:effect (and (pred_12 ?v12) (not (pred_12 ?v5))))

(:action op_3
:parameters (?v5 ?v7)
:precondition (and (pred_4 ?v5) (pred_7 ?v7) 
                  (pred_12 ?v5) (pred_8 ?v7 ?v5) (pred_10 ))
:effect (and (pred_6 ?v7)
   (not (pred_8 ?v7 ?v5)) (not (pred_10 ))))


(:action op_1
:parameters (?v5 ?v13 ?v4)
:precondition (and (pred_4 ?v5) (pred_7 ?v13) (pred_7 ?v4)
                  (pred_12 ?v5) (pred_6 ?v4) (pred_8 ?v13 ?v5))
:effect (and (pred_6 ?v13) (pred_8 ?v4 ?v5)
        (not (pred_6 ?v4)) (not (pred_8 ?v13 ?v5))))

(:action op_4
:parameters (?v5 ?v7)
:precondition (and (pred_4 ?v5) (pred_7 ?v7) 
                  (pred_12 ?v5) (pred_6 ?v7))
:effect (and (pred_10 ) (pred_8 ?v7 ?v5) (not (pred_6 ?v7)))))


	
