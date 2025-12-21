(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_09 - type_1
obj_04 obj_02 - type_3
obj_07 obj_08 obj_03 obj_10 - type_2
obj_05 obj_01 obj_06 - object)
(:init
(pred_4 obj_09 obj_07)
(pred_2 obj_09 obj_04)
(pred_2 obj_09 obj_02)
(pred_3 obj_05 obj_03)
(pred_3 obj_01 obj_10)
(pred_3 obj_06 obj_03)
)
(:goal
(and
(pred_3 obj_05 obj_03)
(pred_3 obj_01 obj_10)
(pred_3 obj_06 obj_10)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_1 obj_09 ?b obj_02))))
)
)