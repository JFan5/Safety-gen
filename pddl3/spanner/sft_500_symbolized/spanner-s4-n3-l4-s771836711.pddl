; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 771836711 --problem-name spanner-s4-n3-l4-s771836711
(define (problem spanner-s4-n3-l4-s771836711)
 (:domain spanner)
 (:objects 
     obj_11 - type_3
     obj_03 obj_12 obj_05 obj_08 - type_5
     obj_01 obj_02 obj_07 - type_2
     obj_09 obj_10 obj_13 obj_06 - type_1
     obj_04 obj_14 - type_1
    )
 (:init 
    (pred_5 obj_11 obj_04)
    (pred_5 obj_03 obj_13)
    (pred_6 obj_03)
    (pred_5 obj_12 obj_09)
    (pred_6 obj_12)
    (pred_5 obj_05 obj_10)
    (pred_6 obj_05)
    (pred_5 obj_08 obj_10)
    (pred_6 obj_08)
    (pred_1 obj_01)
    (pred_5 obj_01 obj_14)
    (pred_1 obj_02)
    (pred_5 obj_02 obj_14)
    (pred_1 obj_07)
    (pred_5 obj_07 obj_14)
    (pred_2 obj_04 obj_09)
    (pred_2 obj_06 obj_14)
    (pred_2 obj_09 obj_10)
    (pred_2 obj_10 obj_13)
    (pred_2 obj_13 obj_06)
)
 (:goal
  (and
   (pred_4 obj_01)
   (pred_4 obj_02)
   (pred_4 obj_07)
))
(:constraints
  (and
    (always (imply (not (pred_4 obj_02)) (not (pred_4 obj_07))))
    (forall (?m - type_3) (at-most-once (pred_5 ?m obj_04)))
  )
)
)
