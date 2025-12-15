(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_08 - type_2
obj_05 obj_09 - type_3
obj_04 obj_10 obj_03 obj_06 - type_1
obj_01 obj_02 obj_07 - object)
(:init
(pred_1 obj_08 obj_04)
(pred_2 obj_08 obj_05)
(pred_2 obj_08 obj_09)
(pred_3 obj_01 obj_10)
(pred_3 obj_02 obj_10)
(pred_3 obj_07 obj_10)
)
(:goal
(and
(pred_3 obj_01 obj_03)
(pred_3 obj_02 obj_10)
(pred_3 obj_07 obj_03)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_4 obj_08 ?b obj_09))))
)
)