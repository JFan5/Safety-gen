; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 1282268636 --problem-name spanner-s4-n3-l4-s1282268636
(define (problem spanner-s4-n3-l4-s1282268636)
 (:domain spanner)
 (:objects 
     obj_01 - type_2
     obj_06 obj_09 obj_13 obj_04 - type_1
     obj_11 obj_03 obj_10 - type_4
     obj_08 obj_07 obj_05 obj_12 - type_5
     obj_14 obj_02 - type_5
    )
 (:init 
    (pred_6 obj_01 obj_14)
    (pred_6 obj_06 obj_07)
    (pred_3 obj_06)
    (pred_6 obj_09 obj_05)
    (pred_3 obj_09)
    (pred_6 obj_13 obj_05)
    (pred_3 obj_13)
    (pred_6 obj_04 obj_05)
    (pred_3 obj_04)
    (pred_1 obj_11)
    (pred_6 obj_11 obj_02)
    (pred_1 obj_03)
    (pred_6 obj_03 obj_02)
    (pred_1 obj_10)
    (pred_6 obj_10 obj_02)
    (pred_2 obj_14 obj_08)
    (pred_2 obj_12 obj_02)
    (pred_2 obj_08 obj_07)
    (pred_2 obj_07 obj_05)
    (pred_2 obj_05 obj_12)
)
 (:goal
  (and
   (pred_5 obj_11)
   (pred_5 obj_03)
   (pred_5 obj_10)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_11)) (not (pred_5 obj_03))))
    (forall (?m - type_2) (at-most-once (pred_6 ?m obj_14)))
  )
)
)
