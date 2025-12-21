; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 1646326112 --problem-name spanner-s4-n3-l4-s1646326112
(define (problem spanner-s4-n3-l4-s1646326112)
 (:domain spanner)
 (:objects 
     obj_07 - type_5
     obj_06 obj_02 obj_09 obj_12 - type_3
     obj_04 obj_11 obj_01 - type_1
     obj_03 obj_10 obj_14 obj_08 - type_2
     obj_13 obj_05 - type_2
    )
 (:init 
    (pred_6 obj_07 obj_13)
    (pred_6 obj_06 obj_14)
    (pred_5 obj_06)
    (pred_6 obj_02 obj_14)
    (pred_5 obj_02)
    (pred_6 obj_09 obj_10)
    (pred_5 obj_09)
    (pred_6 obj_12 obj_14)
    (pred_5 obj_12)
    (pred_4 obj_04)
    (pred_6 obj_04 obj_05)
    (pred_4 obj_11)
    (pred_6 obj_11 obj_05)
    (pred_4 obj_01)
    (pred_6 obj_01 obj_05)
    (pred_3 obj_13 obj_03)
    (pred_3 obj_08 obj_05)
    (pred_3 obj_03 obj_10)
    (pred_3 obj_10 obj_14)
    (pred_3 obj_14 obj_08)
)
 (:goal
  (and
   (pred_1 obj_04)
   (pred_1 obj_11)
   (pred_1 obj_01)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_11)) (not (pred_1 obj_01))))
    (forall (?m - type_5) (at-most-once (pred_6 ?m obj_13)))
  )
)
)
