; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 1187492693 --problem-name spanner-s4-n3-l4-s1187492693
(define (problem spanner-s4-n3-l4-s1187492693)
 (:domain spanner)
 (:objects 
     obj_06 - type_5
     obj_12 obj_08 obj_14 obj_05 - type_1
     obj_03 obj_02 obj_04 - type_4
     obj_09 obj_13 obj_10 obj_07 - type_3
     obj_11 obj_01 - type_3
    )
 (:init 
    (pred_6 obj_06 obj_11)
    (pred_6 obj_12 obj_09)
    (pred_5 obj_12)
    (pred_6 obj_08 obj_10)
    (pred_5 obj_08)
    (pred_6 obj_14 obj_10)
    (pred_5 obj_14)
    (pred_6 obj_05 obj_13)
    (pred_5 obj_05)
    (pred_4 obj_03)
    (pred_6 obj_03 obj_01)
    (pred_4 obj_02)
    (pred_6 obj_02 obj_01)
    (pred_4 obj_04)
    (pred_6 obj_04 obj_01)
    (pred_1 obj_11 obj_09)
    (pred_1 obj_07 obj_01)
    (pred_1 obj_09 obj_13)
    (pred_1 obj_13 obj_10)
    (pred_1 obj_10 obj_07)
)
 (:goal
  (and
   (pred_3 obj_03)
   (pred_3 obj_02)
   (pred_3 obj_04)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_03)) (not (pred_3 obj_02))))
    (forall (?m - type_5) (at-most-once (pred_6 ?m obj_11)))
  )
)
)
