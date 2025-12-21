(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_11 ?v4 ?v2)
             (pred_2 ?v1 ?v11)
             (pred_6 ?v4 ?v11)
             (pred_8 ?v12 ?v4 )
	     (pred_4 ?v4)
             (pred_1 ?v10)
             (pred_3 ?v1)
             (pred_7 ?v11)
             (pred_10 ?v4)
             (pred_5 ?v1)
             (pred_9 ?v4)
             (pred_12 ))



(:action op_2
:parameters (?v3 ?v7 ?v9 ?v13)
:precondition (and (pred_1 ?v3) (pred_1 ?v7) (pred_3 ?v9) (pred_7 ?v13)
          (pred_11 ?v3 ?v7) (pred_2 ?v9 ?v13)
                   (pred_6 ?v7 ?v13) (pred_4 ?v3) 
                   (pred_10 ?v7) (pred_5 ?v9))
:effect (and  (pred_9 ?v7) (not (pred_10 ?v7))))


(:action op_5
:parameters (?v3 ?v6)
:precondition (and (pred_1 ?v3) (pred_1 ?v6)
               (pred_4 ?v3) (pred_11 ?v3 ?v6) (pred_9 ?v6))
:effect (and (pred_4 ?v6) (not (pred_4 ?v3))))

(:action op_1
:parameters (?v3 ?v9)
:precondition (and (pred_1 ?v3) (pred_3 ?v9) 
                  (pred_4 ?v3) (pred_8 ?v9 ?v3) (pred_12 ))
:effect (and (pred_5 ?v9)
   (not (pred_8 ?v9 ?v3)) (not (pred_12 ))))


(:action op_4
:parameters (?v3 ?v8 ?v5)
:precondition (and (pred_1 ?v3) (pred_3 ?v8) (pred_3 ?v5)
                  (pred_4 ?v3) (pred_5 ?v5) (pred_8 ?v8 ?v3))
:effect (and (pred_5 ?v8) (pred_8 ?v5 ?v3)
        (not (pred_5 ?v5)) (not (pred_8 ?v8 ?v3))))

(:action op_3
:parameters (?v3 ?v9)
:precondition (and (pred_1 ?v3) (pred_3 ?v9) 
                  (pred_4 ?v3) (pred_5 ?v9))
:effect (and (pred_12 ) (pred_8 ?v9 ?v3) (not (pred_5 ?v9)))))


	
