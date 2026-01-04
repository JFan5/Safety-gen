(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_04 - type_2
obj_08 obj_09 - type_1
obj_02 obj_10 obj_03 obj_01 - type_3
obj_07 obj_06 obj_05 - object)
(:init
(pred_1 obj_04 obj_10)
(pred_3 obj_04 obj_08)
(pred_3 obj_04 obj_09)
(pred_2 obj_07 obj_10)
(pred_2 obj_06 obj_10)
(pred_2 obj_05 obj_01)
)
(:goal
(and
(pred_2 obj_07 obj_10)
(pred_2 obj_06 obj_03)
(pred_2 obj_05 obj_03)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_4 obj_04 ?b obj_09))))
)
)