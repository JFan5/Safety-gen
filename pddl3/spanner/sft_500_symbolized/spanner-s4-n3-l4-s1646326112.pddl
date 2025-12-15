; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 1646326112 --problem-name spanner-s4-n3-l4-s1646326112
(define (problem spanner-s4-n3-l4-s1646326112)
 (:domain spanner)
 (:objects 
     obj_07 - type_2
     obj_03 obj_08 obj_02 obj_10 - type_1
     obj_06 obj_05 obj_13 - type_5
     obj_11 obj_01 obj_14 obj_12 - type_4
     obj_09 obj_04 - type_4
    )
 (:init 
    (pred_5 obj_07 obj_09)
    (pred_5 obj_03 obj_14)
    (pred_4 obj_03)
    (pred_5 obj_08 obj_14)
    (pred_4 obj_08)
    (pred_5 obj_02 obj_01)
    (pred_4 obj_02)
    (pred_5 obj_10 obj_14)
    (pred_4 obj_10)
    (pred_6 obj_06)
    (pred_5 obj_06 obj_04)
    (pred_6 obj_05)
    (pred_5 obj_05 obj_04)
    (pred_6 obj_13)
    (pred_5 obj_13 obj_04)
    (pred_3 obj_09 obj_11)
    (pred_3 obj_12 obj_04)
    (pred_3 obj_11 obj_01)
    (pred_3 obj_01 obj_14)
    (pred_3 obj_14 obj_12)
)
 (:goal
  (and
   (pred_2 obj_06)
   (pred_2 obj_05)
   (pred_2 obj_13)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_05)) (not (pred_2 obj_13))))
    (forall (?m - type_2) (at-most-once (pred_5 ?m obj_09)))
  )
)
)
