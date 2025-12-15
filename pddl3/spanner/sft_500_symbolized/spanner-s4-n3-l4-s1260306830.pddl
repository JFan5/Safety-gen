; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 1260306830 --problem-name spanner-s4-n3-l4-s1260306830
(define (problem spanner-s4-n3-l4-s1260306830)
 (:domain spanner)
 (:objects 
     obj_02 - type_5
     obj_10 obj_06 obj_08 obj_07 - type_2
     obj_05 obj_12 obj_09 - type_3
     obj_04 obj_01 obj_03 obj_11 - type_4
     obj_13 obj_14 - type_4
    )
 (:init 
    (pred_5 obj_02 obj_13)
    (pred_5 obj_10 obj_04)
    (pred_3 obj_10)
    (pred_5 obj_06 obj_11)
    (pred_3 obj_06)
    (pred_5 obj_08 obj_04)
    (pred_3 obj_08)
    (pred_5 obj_07 obj_03)
    (pred_3 obj_07)
    (pred_4 obj_05)
    (pred_5 obj_05 obj_14)
    (pred_4 obj_12)
    (pred_5 obj_12 obj_14)
    (pred_4 obj_09)
    (pred_5 obj_09 obj_14)
    (pred_1 obj_13 obj_04)
    (pred_1 obj_11 obj_14)
    (pred_1 obj_04 obj_01)
    (pred_1 obj_01 obj_03)
    (pred_1 obj_03 obj_11)
)
 (:goal
  (and
   (pred_6 obj_05)
   (pred_6 obj_12)
   (pred_6 obj_09)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_05)) (not (pred_6 obj_12))))
    (forall (?m - type_5) (at-most-once (pred_5 ?m obj_13)))
  )
)
)
