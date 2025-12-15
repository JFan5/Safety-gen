(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_06 - type_2
obj_10 obj_03 - type_1
obj_09 obj_02 obj_01 obj_08 - type_3
obj_05 obj_07 obj_04 - object)
(:init
(pred_3 obj_06 obj_08)
(pred_1 obj_06 obj_10)
(pred_1 obj_06 obj_03)
(pred_4 obj_05 obj_01)
(pred_4 obj_07 obj_02)
(pred_4 obj_04 obj_01)
)
(:goal
(and
(pred_4 obj_05 obj_02)
(pred_4 obj_07 obj_09)
(pred_4 obj_04 obj_09)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_2 obj_06 ?b obj_10))))
)
)