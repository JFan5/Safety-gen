(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_04 - type_1
obj_06 obj_10 - type_3
obj_02 obj_03 obj_01 obj_07 - type_2
obj_09 obj_08 obj_05 - object)
(:init
(pred_4 obj_04 obj_01)
(pred_2 obj_04 obj_06)
(pred_2 obj_04 obj_10)
(pred_3 obj_09 obj_02)
(pred_3 obj_08 obj_01)
(pred_3 obj_05 obj_01)
)
(:goal
(and
(pred_3 obj_09 obj_03)
(pred_3 obj_08 obj_07)
(pred_3 obj_05 obj_01)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_1 obj_04 ?b obj_10))))
)
)