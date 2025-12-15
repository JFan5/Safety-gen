(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_11 ?v12 ?v2)
             (pred_3 ?v8 ?v1)
             (pred_10 ?v12 ?v1)
             (pred_7 ?v5 ?v12 )
	     (pred_4 ?v12)
             (pred_5 ?v4)
             (pred_8 ?v8)
             (pred_6 ?v1)
             (pred_2 ?v12)
             (pred_1 ?v8)
             (pred_9 ?v12)
             (pred_12 ))



(:action op_2
:parameters (?v7 ?v10 ?v13 ?v3)
:precondition (and (pred_5 ?v7) (pred_5 ?v10) (pred_8 ?v13) (pred_6 ?v3)
          (pred_11 ?v7 ?v10) (pred_3 ?v13 ?v3)
                   (pred_10 ?v10 ?v3) (pred_4 ?v7) 
                   (pred_2 ?v10) (pred_1 ?v13))
:effect (and  (pred_9 ?v10) (not (pred_2 ?v10))))


(:action op_3
:parameters (?v7 ?v11)
:precondition (and (pred_5 ?v7) (pred_5 ?v11)
               (pred_4 ?v7) (pred_11 ?v7 ?v11) (pred_9 ?v11))
:effect (and (pred_4 ?v11) (not (pred_4 ?v7))))

(:action op_5
:parameters (?v7 ?v13)
:precondition (and (pred_5 ?v7) (pred_8 ?v13) 
                  (pred_4 ?v7) (pred_7 ?v13 ?v7) (pred_12 ))
:effect (and (pred_1 ?v13)
   (not (pred_7 ?v13 ?v7)) (not (pred_12 ))))


(:action op_4
:parameters (?v7 ?v6 ?v9)
:precondition (and (pred_5 ?v7) (pred_8 ?v6) (pred_8 ?v9)
                  (pred_4 ?v7) (pred_1 ?v9) (pred_7 ?v6 ?v7))
:effect (and (pred_1 ?v6) (pred_7 ?v9 ?v7)
        (not (pred_1 ?v9)) (not (pred_7 ?v6 ?v7))))

(:action op_1
:parameters (?v7 ?v13)
:precondition (and (pred_5 ?v7) (pred_8 ?v13) 
                  (pred_4 ?v7) (pred_1 ?v13))
:effect (and (pred_12 ) (pred_7 ?v13 ?v7) (not (pred_1 ?v13)))))


	
