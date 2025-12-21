(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_7 ?v12 ?v4)
             (pred_2 ?v9 ?v10)
             (pred_10 ?v12 ?v10)
             (pred_1 ?v6 ?v12 )
	     (pred_6 ?v12)
             (pred_5 ?v8)
             (pred_11 ?v9)
             (pred_4 ?v10)
             (pred_9 ?v12)
             (pred_3 ?v9)
             (pred_12 ?v12)
             (pred_8 ))



(:action op_3
:parameters (?v5 ?v7 ?v3 ?v1)
:precondition (and (pred_5 ?v5) (pred_5 ?v7) (pred_11 ?v3) (pred_4 ?v1)
          (pred_7 ?v5 ?v7) (pred_2 ?v3 ?v1)
                   (pred_10 ?v7 ?v1) (pred_6 ?v5) 
                   (pred_9 ?v7) (pred_3 ?v3))
:effect (and  (pred_12 ?v7) (not (pred_9 ?v7))))


(:action op_5
:parameters (?v5 ?v11)
:precondition (and (pred_5 ?v5) (pred_5 ?v11)
               (pred_6 ?v5) (pred_7 ?v5 ?v11) (pred_12 ?v11))
:effect (and (pred_6 ?v11) (not (pred_6 ?v5))))

(:action op_4
:parameters (?v5 ?v3)
:precondition (and (pred_5 ?v5) (pred_11 ?v3) 
                  (pred_6 ?v5) (pred_1 ?v3 ?v5) (pred_8 ))
:effect (and (pred_3 ?v3)
   (not (pred_1 ?v3 ?v5)) (not (pred_8 ))))


(:action op_1
:parameters (?v5 ?v13 ?v2)
:precondition (and (pred_5 ?v5) (pred_11 ?v13) (pred_11 ?v2)
                  (pred_6 ?v5) (pred_3 ?v2) (pred_1 ?v13 ?v5))
:effect (and (pred_3 ?v13) (pred_1 ?v2 ?v5)
        (not (pred_3 ?v2)) (not (pred_1 ?v13 ?v5))))

(:action op_2
:parameters (?v5 ?v3)
:precondition (and (pred_5 ?v5) (pred_11 ?v3) 
                  (pred_6 ?v5) (pred_3 ?v3))
:effect (and (pred_8 ) (pred_1 ?v3 ?v5) (not (pred_3 ?v3)))))


	
