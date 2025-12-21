(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_09 - type_1
obj_01 obj_04 - type_2
obj_02 obj_06 obj_03 obj_08 - type_3
obj_07 obj_05 obj_10 - object)
(:init
(pred_1 obj_09 obj_03)
(pred_3 obj_09 obj_01)
(pred_3 obj_09 obj_04)
(pred_2 obj_07 obj_03)
(pred_2 obj_05 obj_08)
(pred_2 obj_10 obj_06)
)
(:goal
(and
(pred_2 obj_07 obj_08)
(pred_2 obj_05 obj_03)
(pred_2 obj_10 obj_02)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_4 obj_09 ?b obj_04))))
)
)