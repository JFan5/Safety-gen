(define (problem gripper-1-3-3)
(:domain gripper-strips)
(:objects obj_04 - type_1
obj_07 obj_05 - type_2
obj_03 obj_06 obj_01 - type_3
obj_02 obj_09 obj_08 - object)
(:init
(pred_1 obj_04 obj_01)
(pred_3 obj_04 obj_07)
(pred_3 obj_04 obj_05)
(pred_2 obj_02 obj_01)
(pred_2 obj_09 obj_01)
(pred_2 obj_08 obj_01)
)
(:goal
(and
(pred_2 obj_02 obj_01)
(pred_2 obj_09 obj_01)
(pred_2 obj_08 obj_03)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_4 obj_04 ?b obj_05))))
)
)