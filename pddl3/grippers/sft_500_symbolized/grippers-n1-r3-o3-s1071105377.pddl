(define (problem gripper-1-3-3)
(:domain gripper-strips)
(:objects obj_01 - type_2
obj_08 obj_06 - type_3
obj_07 obj_05 obj_03 - type_1
obj_04 obj_09 obj_02 - object)
(:init
(pred_3 obj_01 obj_07)
(pred_1 obj_01 obj_08)
(pred_1 obj_01 obj_06)
(pred_4 obj_04 obj_07)
(pred_4 obj_09 obj_07)
(pred_4 obj_02 obj_03)
)
(:goal
(and
(pred_4 obj_04 obj_05)
(pred_4 obj_09 obj_05)
(pred_4 obj_02 obj_03)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_2 obj_01 ?b obj_06))))
)
)