(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_9 ?v2 ?v8)
             (pred_10 ?v11 ?v6)
             (pred_3 ?v2 ?v6)
             (pred_7 ?v10 ?v2 )
	     (pred_5 ?v2)
             (pred_11 ?v12)
             (pred_12 ?v11)
             (pred_1 ?v6)
             (pred_6 ?v2)
             (pred_8 ?v11)
             (pred_2 ?v2)
             (pred_4 ))



(:action op_2
:parameters (?v5 ?v7 ?v3 ?v13)
:precondition (and (pred_11 ?v5) (pred_11 ?v7) (pred_12 ?v3) (pred_1 ?v13)
          (pred_9 ?v5 ?v7) (pred_10 ?v3 ?v13)
                   (pred_3 ?v7 ?v13) (pred_5 ?v5) 
                   (pred_6 ?v7) (pred_8 ?v3))
:effect (and  (pred_2 ?v7) (not (pred_6 ?v7))))


(:action op_4
:parameters (?v5 ?v9)
:precondition (and (pred_11 ?v5) (pred_11 ?v9)
               (pred_5 ?v5) (pred_9 ?v5 ?v9) (pred_2 ?v9))
:effect (and (pred_5 ?v9) (not (pred_5 ?v5))))

(:action op_3
:parameters (?v5 ?v3)
:precondition (and (pred_11 ?v5) (pred_12 ?v3) 
                  (pred_5 ?v5) (pred_7 ?v3 ?v5) (pred_4 ))
:effect (and (pred_8 ?v3)
   (not (pred_7 ?v3 ?v5)) (not (pred_4 ))))


(:action op_5
:parameters (?v5 ?v1 ?v4)
:precondition (and (pred_11 ?v5) (pred_12 ?v1) (pred_12 ?v4)
                  (pred_5 ?v5) (pred_8 ?v4) (pred_7 ?v1 ?v5))
:effect (and (pred_8 ?v1) (pred_7 ?v4 ?v5)
        (not (pred_8 ?v4)) (not (pred_7 ?v1 ?v5))))

(:action op_1
:parameters (?v5 ?v3)
:precondition (and (pred_11 ?v5) (pred_12 ?v3) 
                  (pred_5 ?v5) (pred_8 ?v3))
:effect (and (pred_4 ) (pred_7 ?v3 ?v5) (not (pred_8 ?v3)))))


	
