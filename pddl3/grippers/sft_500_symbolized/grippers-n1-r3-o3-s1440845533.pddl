(define (problem gripper-1-3-3)
(:domain gripper-strips)
(:objects obj_03 - type_1
obj_05 obj_06 - type_3
obj_07 obj_08 obj_04 - type_2
obj_09 obj_01 obj_02 - object)
(:init
(pred_2 obj_03 obj_07)
(pred_3 obj_03 obj_05)
(pred_3 obj_03 obj_06)
(pred_1 obj_09 obj_04)
(pred_1 obj_01 obj_08)
(pred_1 obj_02 obj_04)
)
(:goal
(and
(pred_1 obj_09 obj_04)
(pred_1 obj_01 obj_07)
(pred_1 obj_02 obj_07)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_4 obj_03 ?b obj_06))))
)
)