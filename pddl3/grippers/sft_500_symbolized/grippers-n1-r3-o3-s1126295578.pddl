(define (problem gripper-1-3-3)
(:domain gripper-strips)
(:objects obj_03 - type_1
obj_06 obj_02 - type_3
obj_07 obj_08 obj_04 - type_2
obj_09 obj_05 obj_01 - object)
(:init
(pred_3 obj_03 obj_08)
(pred_1 obj_03 obj_06)
(pred_1 obj_03 obj_02)
(pred_4 obj_09 obj_07)
(pred_4 obj_05 obj_07)
(pred_4 obj_01 obj_04)
)
(:goal
(and
(pred_4 obj_09 obj_07)
(pred_4 obj_05 obj_08)
(pred_4 obj_01 obj_07)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_2 obj_03 ?b obj_02))))
)
)