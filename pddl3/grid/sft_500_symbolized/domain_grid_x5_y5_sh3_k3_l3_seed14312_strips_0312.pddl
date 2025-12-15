(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_5 ?v9 ?v8)
             (pred_4 ?v12 ?v3)
             (pred_2 ?v9 ?v3)
             (pred_7 ?v10 ?v9 )
	     (pred_6 ?v9)
             (pred_8 ?v2)
             (pred_11 ?v12)
             (pred_10 ?v3)
             (pred_1 ?v9)
             (pred_3 ?v12)
             (pred_9 ?v9)
             (pred_12 ))



(:action op_5
:parameters (?v7 ?v1 ?v5 ?v6)
:precondition (and (pred_8 ?v7) (pred_8 ?v1) (pred_11 ?v5) (pred_10 ?v6)
          (pred_5 ?v7 ?v1) (pred_4 ?v5 ?v6)
                   (pred_2 ?v1 ?v6) (pred_6 ?v7) 
                   (pred_1 ?v1) (pred_3 ?v5))
:effect (and  (pred_9 ?v1) (not (pred_1 ?v1))))


(:action op_4
:parameters (?v7 ?v4)
:precondition (and (pred_8 ?v7) (pred_8 ?v4)
               (pred_6 ?v7) (pred_5 ?v7 ?v4) (pred_9 ?v4))
:effect (and (pred_6 ?v4) (not (pred_6 ?v7))))

(:action op_2
:parameters (?v7 ?v5)
:precondition (and (pred_8 ?v7) (pred_11 ?v5) 
                  (pred_6 ?v7) (pred_7 ?v5 ?v7) (pred_12 ))
:effect (and (pred_3 ?v5)
   (not (pred_7 ?v5 ?v7)) (not (pred_12 ))))


(:action op_3
:parameters (?v7 ?v13 ?v11)
:precondition (and (pred_8 ?v7) (pred_11 ?v13) (pred_11 ?v11)
                  (pred_6 ?v7) (pred_3 ?v11) (pred_7 ?v13 ?v7))
:effect (and (pred_3 ?v13) (pred_7 ?v11 ?v7)
        (not (pred_3 ?v11)) (not (pred_7 ?v13 ?v7))))

(:action op_1
:parameters (?v7 ?v5)
:precondition (and (pred_8 ?v7) (pred_11 ?v5) 
                  (pred_6 ?v7) (pred_3 ?v5))
:effect (and (pred_12 ) (pred_7 ?v5 ?v7) (not (pred_3 ?v5)))))


	
