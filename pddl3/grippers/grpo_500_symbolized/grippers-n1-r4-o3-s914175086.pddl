(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_07 - type_1
obj_05 obj_06 - type_3
obj_10 obj_03 obj_09 obj_08 - type_2
obj_01 obj_04 obj_02 - object)
(:init
(pred_4 obj_07 obj_09)
(pred_2 obj_07 obj_05)
(pred_2 obj_07 obj_06)
(pred_3 obj_01 obj_03)
(pred_3 obj_04 obj_03)
(pred_3 obj_02 obj_03)
)
(:goal
(and
(pred_3 obj_01 obj_10)
(pred_3 obj_04 obj_08)
(pred_3 obj_02 obj_03)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_1 obj_07 ?b obj_06))))
)
)