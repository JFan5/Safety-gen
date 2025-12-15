(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_01 - type_3
obj_08 obj_09 - type_2
obj_06 obj_10 obj_05 obj_07 - type_1
obj_03 obj_04 obj_02 - object)
(:init
(pred_3 obj_01 obj_07)
(pred_2 obj_01 obj_08)
(pred_2 obj_01 obj_09)
(pred_1 obj_03 obj_06)
(pred_1 obj_04 obj_05)
(pred_1 obj_02 obj_10)
)
(:goal
(and
(pred_1 obj_03 obj_07)
(pred_1 obj_04 obj_07)
(pred_1 obj_02 obj_06)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_4 obj_01 ?b obj_09))))
)
)