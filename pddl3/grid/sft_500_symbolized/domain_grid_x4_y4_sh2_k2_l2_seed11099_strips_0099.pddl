(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_6 ?v4 ?v1)
             (pred_12 ?v8 ?v10)
             (pred_5 ?v4 ?v10)
             (pred_2 ?v6 ?v4 )
	     (pred_7 ?v4)
             (pred_11 ?v3)
             (pred_1 ?v8)
             (pred_3 ?v10)
             (pred_9 ?v4)
             (pred_4 ?v8)
             (pred_10 ?v4)
             (pred_8 ))



(:action op_3
:parameters (?v7 ?v11 ?v9 ?v12)
:precondition (and (pred_11 ?v7) (pred_11 ?v11) (pred_1 ?v9) (pred_3 ?v12)
          (pred_6 ?v7 ?v11) (pred_12 ?v9 ?v12)
                   (pred_5 ?v11 ?v12) (pred_7 ?v7) 
                   (pred_9 ?v11) (pred_4 ?v9))
:effect (and  (pred_10 ?v11) (not (pred_9 ?v11))))


(:action op_5
:parameters (?v7 ?v2)
:precondition (and (pred_11 ?v7) (pred_11 ?v2)
               (pred_7 ?v7) (pred_6 ?v7 ?v2) (pred_10 ?v2))
:effect (and (pred_7 ?v2) (not (pred_7 ?v7))))

(:action op_1
:parameters (?v7 ?v9)
:precondition (and (pred_11 ?v7) (pred_1 ?v9) 
                  (pred_7 ?v7) (pred_2 ?v9 ?v7) (pred_8 ))
:effect (and (pred_4 ?v9)
   (not (pred_2 ?v9 ?v7)) (not (pred_8 ))))


(:action op_4
:parameters (?v7 ?v13 ?v5)
:precondition (and (pred_11 ?v7) (pred_1 ?v13) (pred_1 ?v5)
                  (pred_7 ?v7) (pred_4 ?v5) (pred_2 ?v13 ?v7))
:effect (and (pred_4 ?v13) (pred_2 ?v5 ?v7)
        (not (pred_4 ?v5)) (not (pred_2 ?v13 ?v7))))

(:action op_2
:parameters (?v7 ?v9)
:precondition (and (pred_11 ?v7) (pred_1 ?v9) 
                  (pred_7 ?v7) (pred_4 ?v9))
:effect (and (pred_8 ) (pred_2 ?v9 ?v7) (not (pred_4 ?v9)))))


	
