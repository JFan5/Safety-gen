; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 228132619 --problem-name spanner-s4-n3-l4-s228132619
(define (problem spanner-s4-n3-l4-s228132619)
 (:domain spanner)
 (:objects 
     obj_02 - type_4
     obj_14 obj_13 obj_10 obj_09 - type_2
     obj_05 obj_12 obj_08 - type_5
     obj_01 obj_06 obj_03 obj_04 - type_3
     obj_07 obj_11 - type_3
    )
 (:init 
    (pred_1 obj_02 obj_07)
    (pred_1 obj_14 obj_01)
    (pred_5 obj_14)
    (pred_1 obj_13 obj_04)
    (pred_5 obj_13)
    (pred_1 obj_10 obj_01)
    (pred_5 obj_10)
    (pred_1 obj_09 obj_01)
    (pred_5 obj_09)
    (pred_6 obj_05)
    (pred_1 obj_05 obj_11)
    (pred_6 obj_12)
    (pred_1 obj_12 obj_11)
    (pred_6 obj_08)
    (pred_1 obj_08 obj_11)
    (pred_2 obj_07 obj_01)
    (pred_2 obj_04 obj_11)
    (pred_2 obj_01 obj_06)
    (pred_2 obj_06 obj_03)
    (pred_2 obj_03 obj_04)
)
 (:goal
  (and
   (pred_3 obj_05)
   (pred_3 obj_12)
   (pred_3 obj_08)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_05)) (not (pred_3 obj_12))))
    (forall (?m - type_4) (at-most-once (pred_1 ?m obj_07)))
  )
)
)
