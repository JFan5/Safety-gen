; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 2 2 3 --seed 256643664 --problem-name spanner-s2-n2-l3-s256643664
(define (problem spanner-s2-n2-l3-s256643664)
 (:domain spanner)
 (:objects 
     obj_01 - type_5
     obj_03 obj_06 - type_1
     obj_08 obj_05 - type_3
     obj_09 obj_02 obj_10 - type_4
     obj_07 obj_04 - type_4
    )
 (:init 
    (pred_5 obj_01 obj_07)
    (pred_5 obj_03 obj_10)
    (pred_6 obj_03)
    (pred_5 obj_06 obj_09)
    (pred_6 obj_06)
    (pred_1 obj_08)
    (pred_5 obj_08 obj_04)
    (pred_1 obj_05)
    (pred_5 obj_05 obj_04)
    (pred_2 obj_07 obj_09)
    (pred_2 obj_10 obj_04)
    (pred_2 obj_09 obj_02)
    (pred_2 obj_02 obj_10)
)
 (:goal
  (and
   (pred_3 obj_08)
   (pred_3 obj_05)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_08)) (not (pred_3 obj_05))))
    (forall (?m - type_5) (at-most-once (pred_5 ?m obj_07)))
  )
)
)
