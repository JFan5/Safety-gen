(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_01 - type_1
obj_06 obj_09 - type_2
obj_08 obj_07 obj_10 obj_05 - type_3
obj_04 obj_02 obj_03 - object)
(:init
(pred_1 obj_01 obj_10)
(pred_3 obj_01 obj_06)
(pred_3 obj_01 obj_09)
(pred_4 obj_04 obj_07)
(pred_4 obj_02 obj_07)
(pred_4 obj_03 obj_10)
)
(:goal
(and
(pred_4 obj_04 obj_08)
(pred_4 obj_02 obj_05)
(pred_4 obj_03 obj_05)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_2 obj_01 ?b obj_09))))
)
)