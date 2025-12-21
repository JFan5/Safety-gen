(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_12 ?v11 ?v4)
             (pred_10 ?v8 ?v3)
             (pred_1 ?v11 ?v3)
             (pred_2 ?v6 ?v11 )
	     (pred_5 ?v11)
             (pred_4 ?v13)
             (pred_6 ?v8)
             (pred_9 ?v3)
             (pred_11 ?v11)
             (pred_8 ?v8)
             (pred_7 ?v11)
             (pred_3 ))



(:action op_1
:parameters (?v7 ?v10 ?v9 ?v1)
:precondition (and (pred_4 ?v7) (pred_4 ?v10) (pred_6 ?v9) (pred_9 ?v1)
          (pred_12 ?v7 ?v10) (pred_10 ?v9 ?v1)
                   (pred_1 ?v10 ?v1) (pred_5 ?v7) 
                   (pred_11 ?v10) (pred_8 ?v9))
:effect (and  (pred_7 ?v10) (not (pred_11 ?v10))))


(:action op_5
:parameters (?v7 ?v2)
:precondition (and (pred_4 ?v7) (pred_4 ?v2)
               (pred_5 ?v7) (pred_12 ?v7 ?v2) (pred_7 ?v2))
:effect (and (pred_5 ?v2) (not (pred_5 ?v7))))

(:action op_2
:parameters (?v7 ?v9)
:precondition (and (pred_4 ?v7) (pred_6 ?v9) 
                  (pred_5 ?v7) (pred_2 ?v9 ?v7) (pred_3 ))
:effect (and (pred_8 ?v9)
   (not (pred_2 ?v9 ?v7)) (not (pred_3 ))))


(:action op_4
:parameters (?v7 ?v5 ?v12)
:precondition (and (pred_4 ?v7) (pred_6 ?v5) (pred_6 ?v12)
                  (pred_5 ?v7) (pred_8 ?v12) (pred_2 ?v5 ?v7))
:effect (and (pred_8 ?v5) (pred_2 ?v12 ?v7)
        (not (pred_8 ?v12)) (not (pred_2 ?v5 ?v7))))

(:action op_3
:parameters (?v7 ?v9)
:precondition (and (pred_4 ?v7) (pred_6 ?v9) 
                  (pred_5 ?v7) (pred_8 ?v9))
:effect (and (pred_3 ) (pred_2 ?v9 ?v7) (not (pred_8 ?v9)))))


	
