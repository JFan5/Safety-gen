(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_01 - type_1
obj_08 obj_09 - type_3
obj_10 obj_07 obj_03 obj_05 - type_2
obj_02 obj_06 obj_04 - object)
(:init
(pred_4 obj_01 obj_10)
(pred_2 obj_01 obj_08)
(pred_2 obj_01 obj_09)
(pred_3 obj_02 obj_05)
(pred_3 obj_06 obj_03)
(pred_3 obj_04 obj_05)
)
(:goal
(and
(pred_3 obj_02 obj_05)
(pred_3 obj_06 obj_05)
(pred_3 obj_04 obj_05)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_1 obj_01 ?b obj_09))))
)
)