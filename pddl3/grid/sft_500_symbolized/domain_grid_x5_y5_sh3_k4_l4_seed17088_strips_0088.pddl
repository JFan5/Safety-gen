(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_4 ?v12 ?v13)
             (pred_9 ?v8 ?v2)
             (pred_5 ?v12 ?v2)
             (pred_6 ?v10 ?v12 )
	     (pred_3 ?v12)
             (pred_1 ?v6)
             (pred_10 ?v8)
             (pred_8 ?v2)
             (pred_12 ?v12)
             (pred_11 ?v8)
             (pred_7 ?v12)
             (pred_2 ))



(:action op_4
:parameters (?v7 ?v3 ?v9 ?v4)
:precondition (and (pred_1 ?v7) (pred_1 ?v3) (pred_10 ?v9) (pred_8 ?v4)
          (pred_4 ?v7 ?v3) (pred_9 ?v9 ?v4)
                   (pred_5 ?v3 ?v4) (pred_3 ?v7) 
                   (pred_12 ?v3) (pred_11 ?v9))
:effect (and  (pred_7 ?v3) (not (pred_12 ?v3))))


(:action op_5
:parameters (?v7 ?v1)
:precondition (and (pred_1 ?v7) (pred_1 ?v1)
               (pred_3 ?v7) (pred_4 ?v7 ?v1) (pred_7 ?v1))
:effect (and (pred_3 ?v1) (not (pred_3 ?v7))))

(:action op_2
:parameters (?v7 ?v9)
:precondition (and (pred_1 ?v7) (pred_10 ?v9) 
                  (pred_3 ?v7) (pred_6 ?v9 ?v7) (pred_2 ))
:effect (and (pred_11 ?v9)
   (not (pred_6 ?v9 ?v7)) (not (pred_2 ))))


(:action op_3
:parameters (?v7 ?v11 ?v5)
:precondition (and (pred_1 ?v7) (pred_10 ?v11) (pred_10 ?v5)
                  (pred_3 ?v7) (pred_11 ?v5) (pred_6 ?v11 ?v7))
:effect (and (pred_11 ?v11) (pred_6 ?v5 ?v7)
        (not (pred_11 ?v5)) (not (pred_6 ?v11 ?v7))))

(:action op_1
:parameters (?v7 ?v9)
:precondition (and (pred_1 ?v7) (pred_10 ?v9) 
                  (pred_3 ?v7) (pred_11 ?v9))
:effect (and (pred_2 ) (pred_6 ?v9 ?v7) (not (pred_11 ?v9)))))


	
