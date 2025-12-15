(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_05 - type_1
obj_04 obj_10 - type_3
obj_02 obj_08 obj_09 obj_01 - type_2
obj_07 obj_03 obj_06 - object)
(:init
(pred_3 obj_05 obj_08)
(pred_4 obj_05 obj_04)
(pred_4 obj_05 obj_10)
(pred_2 obj_07 obj_02)
(pred_2 obj_03 obj_08)
(pred_2 obj_06 obj_08)
)
(:goal
(and
(pred_2 obj_07 obj_08)
(pred_2 obj_03 obj_01)
(pred_2 obj_06 obj_02)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_1 obj_05 ?b obj_10))))
)
)