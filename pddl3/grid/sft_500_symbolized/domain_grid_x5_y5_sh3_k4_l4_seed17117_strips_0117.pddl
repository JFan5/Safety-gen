(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_6 ?v4 ?v10)
             (pred_10 ?v6 ?v8)
             (pred_1 ?v4 ?v8)
             (pred_4 ?v5 ?v4 )
	     (pred_7 ?v4)
             (pred_5 ?v13)
             (pred_2 ?v6)
             (pred_11 ?v8)
             (pred_12 ?v4)
             (pred_8 ?v6)
             (pred_9 ?v4)
             (pred_3 ))



(:action op_4
:parameters (?v7 ?v1 ?v9 ?v2)
:precondition (and (pred_5 ?v7) (pred_5 ?v1) (pred_2 ?v9) (pred_11 ?v2)
          (pred_6 ?v7 ?v1) (pred_10 ?v9 ?v2)
                   (pred_1 ?v1 ?v2) (pred_7 ?v7) 
                   (pred_12 ?v1) (pred_8 ?v9))
:effect (and  (pred_9 ?v1) (not (pred_12 ?v1))))


(:action op_2
:parameters (?v7 ?v12)
:precondition (and (pred_5 ?v7) (pred_5 ?v12)
               (pred_7 ?v7) (pred_6 ?v7 ?v12) (pred_9 ?v12))
:effect (and (pred_7 ?v12) (not (pred_7 ?v7))))

(:action op_1
:parameters (?v7 ?v9)
:precondition (and (pred_5 ?v7) (pred_2 ?v9) 
                  (pred_7 ?v7) (pred_4 ?v9 ?v7) (pred_3 ))
:effect (and (pred_8 ?v9)
   (not (pred_4 ?v9 ?v7)) (not (pred_3 ))))


(:action op_3
:parameters (?v7 ?v3 ?v11)
:precondition (and (pred_5 ?v7) (pred_2 ?v3) (pred_2 ?v11)
                  (pred_7 ?v7) (pred_8 ?v11) (pred_4 ?v3 ?v7))
:effect (and (pred_8 ?v3) (pred_4 ?v11 ?v7)
        (not (pred_8 ?v11)) (not (pred_4 ?v3 ?v7))))

(:action op_5
:parameters (?v7 ?v9)
:precondition (and (pred_5 ?v7) (pred_2 ?v9) 
                  (pred_7 ?v7) (pred_8 ?v9))
:effect (and (pred_3 ) (pred_4 ?v9 ?v7) (not (pred_8 ?v9)))))


	
