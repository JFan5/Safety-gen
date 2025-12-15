(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_12 ?v1 ?v8)
             (pred_1 ?v6 ?v2)
             (pred_11 ?v1 ?v2)
             (pred_2 ?v4 ?v1 )
	     (pred_10 ?v1)
             (pred_8 ?v13)
             (pred_4 ?v6)
             (pred_6 ?v2)
             (pred_9 ?v1)
             (pred_7 ?v6)
             (pred_3 ?v1)
             (pred_5 ))



(:action op_5
:parameters (?v5 ?v7 ?v9 ?v12)
:precondition (and (pred_8 ?v5) (pred_8 ?v7) (pred_4 ?v9) (pred_6 ?v12)
          (pred_12 ?v5 ?v7) (pred_1 ?v9 ?v12)
                   (pred_11 ?v7 ?v12) (pred_10 ?v5) 
                   (pred_9 ?v7) (pred_7 ?v9))
:effect (and  (pred_3 ?v7) (not (pred_9 ?v7))))


(:action op_3
:parameters (?v5 ?v11)
:precondition (and (pred_8 ?v5) (pred_8 ?v11)
               (pred_10 ?v5) (pred_12 ?v5 ?v11) (pred_3 ?v11))
:effect (and (pred_10 ?v11) (not (pred_10 ?v5))))

(:action op_4
:parameters (?v5 ?v9)
:precondition (and (pred_8 ?v5) (pred_4 ?v9) 
                  (pred_10 ?v5) (pred_2 ?v9 ?v5) (pred_5 ))
:effect (and (pred_7 ?v9)
   (not (pred_2 ?v9 ?v5)) (not (pred_5 ))))


(:action op_2
:parameters (?v5 ?v10 ?v3)
:precondition (and (pred_8 ?v5) (pred_4 ?v10) (pred_4 ?v3)
                  (pred_10 ?v5) (pred_7 ?v3) (pred_2 ?v10 ?v5))
:effect (and (pred_7 ?v10) (pred_2 ?v3 ?v5)
        (not (pred_7 ?v3)) (not (pred_2 ?v10 ?v5))))

(:action op_1
:parameters (?v5 ?v9)
:precondition (and (pred_8 ?v5) (pred_4 ?v9) 
                  (pred_10 ?v5) (pred_7 ?v9))
:effect (and (pred_5 ) (pred_2 ?v9 ?v5) (not (pred_7 ?v9)))))


	
