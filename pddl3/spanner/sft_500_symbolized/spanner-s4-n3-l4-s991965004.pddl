; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 991965004 --problem-name spanner-s4-n3-l4-s991965004
(define (problem spanner-s4-n3-l4-s991965004)
 (:domain spanner)
 (:objects 
     obj_12 - type_3
     obj_05 obj_10 obj_09 obj_03 - type_5
     obj_13 obj_01 obj_07 - type_4
     obj_06 obj_14 obj_11 obj_08 - type_2
     obj_04 obj_02 - type_2
    )
 (:init 
    (pred_2 obj_12 obj_04)
    (pred_2 obj_05 obj_11)
    (pred_1 obj_05)
    (pred_2 obj_10 obj_06)
    (pred_1 obj_10)
    (pred_2 obj_09 obj_06)
    (pred_1 obj_09)
    (pred_2 obj_03 obj_11)
    (pred_1 obj_03)
    (pred_5 obj_13)
    (pred_2 obj_13 obj_02)
    (pred_5 obj_01)
    (pred_2 obj_01 obj_02)
    (pred_5 obj_07)
    (pred_2 obj_07 obj_02)
    (pred_6 obj_04 obj_06)
    (pred_6 obj_08 obj_02)
    (pred_6 obj_06 obj_14)
    (pred_6 obj_14 obj_11)
    (pred_6 obj_11 obj_08)
)
 (:goal
  (and
   (pred_3 obj_13)
   (pred_3 obj_01)
   (pred_3 obj_07)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_01)) (not (pred_3 obj_07))))
    (forall (?m - type_3) (at-most-once (pred_2 ?m obj_04)))
  )
)
)
